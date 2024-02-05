package com.work.working.common;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Slf4j
@ControllerAdvice(basePackages = "com.work.working.controller")
public class ControllerExceptionHandler {
    @ExceptionHandler(Exception.class)
    protected String handleException(Exception e) {
        log.error("ControllerAdvice", e);
        return "admin/error";
    }
}
