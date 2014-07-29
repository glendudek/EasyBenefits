class MyException < StandardError
  HTTP_OK = 200
  HTTP_BAD_REQUEST = 400
  HTTP_UNAUTHORIZED = 401
  HTTP_FORBIDDEN = 403
  HTTP_NOT_FOUND = 404
  HTTP_GONE = 410
  HTTP_INTERNAL_SERVER_ERROR = 500

  HTTP_STATUS = HTTP_INTERNAL_SERVER_ERROR

  def http_status
    return self.class::HTTP_STATUS
  end
end

class MyException::BadRequest < MyException
  HTTP_STATUS = HTTP_BAD_REQUEST
end

class MyException::Unauthorized < MyException
  HTTP_STATUS = HTTP_FORBIDDEN
end

class MyException::NotFound < MyException
  HTTP_STATUS = HTTP_NOT_FOUND
end

class MyException::InternalError < MyException
  HTTP_STATUS = HTTP_INTERNAL_SERVER_ERROR
end
