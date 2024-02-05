package com.work.working.common;

import com.work.working.common.ErrorCode;

public class CommonException extends Exception{
    private static final long serialVersionUID = 1L;

    protected CommonErrorCode errorCode;

    protected CommonException(){
        this.errorCode = ErrorCode.INTERNAL_SERVER_ERROR;
    }

    protected CommonException(CommonErrorCode errorCode) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
    }

    public CommonErrorCode getErrorCode() {
        return errorCode;
    }
}
