package com.work.working.common;

import lombok.Getter;
import org.springframework.http.HttpStatus;
import com.work.working.common.CommonErrorCode;

@Getter
public enum ErrorCode implements CommonErrorCode{

    INVALID_PARAMETER(HttpStatus.BAD_REQUEST, "E-400", "Bad Request."),
    INTERNAL_SERVER_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "E-500", "Internal Server Error.");

    protected String code;
    protected String message;
    protected HttpStatus status;

    ErrorCode(HttpStatus status, final String code, final String message) {
        this.status = status;
        this.message = message;
        this.code = code;
    }
}
