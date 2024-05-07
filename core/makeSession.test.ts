import { makeSession } from './makeSession';

test('makeSession should return the correct session string', () => {
  const sessionId = '12345';
  const expected = 'SessionId: 12345!';

  const result = makeSession(sessionId);

  expect(result).toBe(expected);
});
