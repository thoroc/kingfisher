bring expect;
bring "./utils.w" as sut;

test "has property from left and right" {
  let left = { "a": 1 };
  let right = { "b": 2 };

  let actual = sut.CoreUtils.mergeJson(left, right);
  let expected = { "a": 1, "b": 2 };

  expect.equal(actual, expected);
}

test "has property from left and right, right overwrites left" {
  let left = { "a": 1 };
  let right = { "a": 2 };

  let actual = sut.CoreUtils.mergeJson(left, right);
  let expected = { "a": 2 };

  expect.equal(actual, expected);
}

test "has property from left and right, right overwrites left, left has more properties" {
  let left = { "a": 1, "b": 2 };
  let right = { "a": 3 };

  let actual = sut.CoreUtils.mergeJson(left, right);
  let expected = { "a": 3, "b": 2 };

  expect.equal(actual, expected);
}

test "has property from left and right, right overwrites left, right has more properties" {
  let left = { "a": 1 };
  let right = { "a": 3, "b": 2 };

  let actual = sut.CoreUtils.mergeJson(left, right);
  let expected = { "a": 3, "b": 2 };

  expect.equal(actual, expected);
}

test "has property from left and right, right overwrites left, left and right have more properties" {
  let left = { "a": 1, "b": 2 };
  let right = { "a": 3, "b": 4, "c": 5 };

  let actual = sut.CoreUtils.mergeJson(left, right);
  let expected = { "a": 3, "b": 4, "c": 5 };

  expect.equal(actual, expected);
}

test "has property from left and right, right does not overwrite left" {
  let left = { "a": 1, "b": 2 };
  let right = { "b": 3 };

  let actual = sut.CoreUtils.mergeJson(left, right, false);
  let expected = { "a": 1, "b": 2 };

  expect.equal(actual, expected);
}