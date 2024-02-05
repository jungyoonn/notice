package com.work.working.exception;

import com.work.working.common.CommonErrorCode;
import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public enum BoardErrorCode implements CommonErrorCode {
    NOT_FOUND(HttpStatus.NOT_FOUND, "E-404", "Partner Id Not Found."),
    INTERNAL_SERVER_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "E-500", "Internal Server Error.");

    private final HttpStatus status;
    private final String code;
    private final String message;


    BoardErrorCode(HttpStatus status, final String code, final String message) {
        this.status = status;
        this.message = message;
        this.code = code;
    }
}