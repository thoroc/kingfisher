// Generated by `@winglibs/vite`. Do not edit.
/** Holds environment variables generated from Wing. */
interface WingEnv {
	readonly TITLE: string;
	readonly API_URL: string;
}
interface Wing { env: WingEnv; }
declare var wing: Wing;
interface Window {
	readonly wing: Wing;
}
