import { randomUUID } from 'crypto';
import { formatHtml } from './formatHtml';

describe('formatHtml', () => {
  it('should return a properly formatted HTML greeting page', () => {
    const sessionId = randomUUID();

    const result = formatHtml(sessionId);

    expect(result).toContain(sessionId);
  });
});
