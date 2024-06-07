pub inflight class CoreUtils {
  pub static inflight mergeJson(left: Json, right: Json, override: bool?): Json {
    // create new object
    let var newObject = MutJson {};

    // iterate over left
    for entry in Json.entries(left) {
      let key = entry.key;
      let value = entry.value;

      // if key existing in left but not in right, add to new object
      if (!right.has(key)) {
        newObject.set(key, value);
      }

      // if key existing in left and right, use right
      if (right.has(key)) {
        if (override ?? true) {
          newObject.set(key, right.get(key));
        } else {
          newObject.set(key, value);
        }
      }
    }

    // iterate over right
    for entry in Json.entries(right) {
      let key = entry.key;
      let value = entry.value;

      // if key existing in right but not in left, add to new object
      if (!left.has(key)) {
        newObject.set(key, value);
      }
    }

    // return new object
    return newObject;
  }
}