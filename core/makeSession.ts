export type Session = {
  sessionId: string;
};

export function makeSession(session: Session): string {
  return `SessionId: ${session.sessionId}!`;
}
