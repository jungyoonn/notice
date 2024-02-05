package com.work.working.common;

import lombok.Builder;
import lombok.Builder.Default;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Map;

@Data
@Builder
public class ErrorResponse {
    @Default
    private LocalDateTime timestamp = LocalDateTime.now();
    
    private String message;

    private String code;

    private int status;

    private Map<String, String> errors;

}
