defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "returns value of deleted key if exists", %{bucket: bucket} do
    val = "def"
    KV.Bucket.put(bucket, "abc", val)
    assert KV.Bucket.delete(bucket, "abc") == val
  end

  test "returns nil if deleted key does not exist", %{bucket: bucket} do
    KV.Bucket.put(bucket, "keyExists", "val")
    assert KV.Bucket.delete(bucket, "badKey") == nil
  end
end
