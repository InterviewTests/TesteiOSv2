import { FormatAccountNumberPipe } from './format-account-number.pipe';

describe('FormatAccountNumberPipe', () => {
  it('create an instance', () => {
    const pipe = new FormatAccountNumberPipe();
    expect(pipe).toBeTruthy();
  });
});
