
import logging
import graypy

logger = logging.getLogger('test_logger')
logger.setLevel(logging.DEBUG)
handler = graypy.GELFHTTPHandler('des-log-collector.log-collector', 12201)

logger.addHandler(handler)
logger.debug('This is a test from a Python script!')

# curl -XPOST http://des-log-collector.log-collector:12201/gelf -p0 -d '{"short_message":"Hello there", "host":"example.org", "facility":"test", "_foo":"bar"}'