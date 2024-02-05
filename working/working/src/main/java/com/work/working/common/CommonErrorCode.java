package com.work.working.common;

import org.springframework.http.HttpStatus;

public interface CommonErrorCode {
    HttpStatus getStatus();
    String getCode();
    String getMessage();
}
