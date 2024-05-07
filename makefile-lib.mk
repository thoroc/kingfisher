include env.mk

export $(shell grep -h -v "^#" env*.mk | grep -v '^$$' | awk -F '=' '{print $$1}' | awk -F ' ?' '{print $$1}')

NPM := pnpm
WING := wing

# Generate usage help from Makefile target comments
help:
	@gawk ' \
	BEGIN { delete targets; target_pad=0; i=1; } \
	/^#/ { \
		sub(/^#\s+/, "", $$0); \
		descriptions[i]=$$0; \
		targets[i]["description"]=$$0; \
	} \
	/^[a-z_-]+:/ { \
		sub(/:/, "", $$1); \
		targets[i]["name"]=$$1; i++; \
		if (length($$1) > target_pad ) target_pad = length($$1); \
	} \
	function cmp_key(i1, v1, i2, v2) { \
		l = v1["name"]; r = v2["name"]; \
		if(l < r) return -1; \
		else if(l == r) return 0; \
		else return 1; \
	}; \
	END { \
		print "Usage:\n"; \
		asort(targets,targets,"cmp_key"); \
		for( i in targets ) \
			printf "%-"target_pad"s  %s\n", targets[i]["name"], targets[i]["description"]; \
	}' Makefile