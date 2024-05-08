import { Session, makeSession } from './makeSession';

test('makeSession should return the correct session string', () => {
  const session: Session = { sessionId: '12345' };
  const expected = 'SessionId: 12345!';

  const result = makeSession(session);

  expect(result).toBe(expected);
});
