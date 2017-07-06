import redis
import redis_lock

LOCK_TIMEOUT = 3
redis_lock.reset_all()


class RedisClient(object):
    def __init__(self, host='localhost', port=6379):
        self.connection = redis.StrictRedis(host, port)

    def keys(self, pattern):
        return self.connection.keys(pattern)

    def get(self, key):
        return self.connection.get(key)

    def set(self, key, value):
        lock = redis_lock.Lock(self.connection, key, expire=LOCK_TIMEOUT)

        if lock.acquire(blocking=False):
            self.connection.set(key, value)
            lock.release()
            return True
        return False

    def delete(self, key):
        self.connection.delete(key)


redis_client = RedisClient()
