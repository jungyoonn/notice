package com.work.working.exception;

import com.work.working.common.CommonErrorCode;

public class BoardException {
    public static class NotFound extends com.work.working.common.CommonException {
        private NotFound(CommonErrorCode errorCode){
            super(errorCode);
            this.errorCode = errorCode;
        }

        public static NotFound of(){
            return new NotFound(BoardErrorCode.NOT_FOUND);
        }
    }
}
