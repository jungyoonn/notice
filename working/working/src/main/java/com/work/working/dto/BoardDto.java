package com.work.working.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.work.working.common.BoardType;
import com.work.working.entity.Board;
import jakarta.validation.constraints.Positive;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.time.LocalDateTime;

public class BoardDto {
    @Data
    @JsonNaming(PropertyNamingStrategies.LowerCamelCaseStrategy.class)
    @NoArgsConstructor(access = AccessLevel.PROTECTED)
    @AllArgsConstructor
    @EqualsAndHashCode()
    @ToString(callSuper = true)
    @SuperBuilder
    protected static class Base {
        protected long id;

        protected String title;

        protected String contents;

        protected BoardType type;

        protected LocalDateTime createdDate;

        protected String createdBy;

        protected LocalDateTime modifiedDate;

        protected String modifiedBy;
    }

    @Data
    @JsonNaming(PropertyNamingStrategies.LowerCamelCaseStrategy.class)
    @NoArgsConstructor(access = AccessLevel.PROTECTED)
    @EqualsAndHashCode(callSuper = true)
    @ToString(callSuper = true)
    @SuperBuilder
    public static class Create extends Base {
        public Board toEntity(){
            return Board.builder()
                    .title(this.title)
                    .contents(this.contents)
                    .type(this.type)
                    .build();
        }
    }

    @Data
    @JsonNaming(PropertyNamingStrategies.LowerCamelCaseStrategy.class)
    @NoArgsConstructor(access = AccessLevel.PROTECTED)
    @EqualsAndHashCode(callSuper=true)
    @ToString(callSuper=true)
    @SuperBuilder
    public static class Update extends Base{
        @Positive
        protected long id;
    }

    @Data
    @JsonNaming(PropertyNamingStrategies.LowerCamelCaseStrategy.class)
    @NoArgsConstructor(access = AccessLevel.PROTECTED)
    @EqualsAndHashCode(callSuper=true)
    @ToString(callSuper=true)
    @SuperBuilder
    public static class Search extends Base{
        @Builder.Default
        protected String title = "";
    }

    @Data
    @JsonNaming(PropertyNamingStrategies.LowerCamelCaseStrategy.class)
    @NoArgsConstructor(access = AccessLevel.PROTECTED)
    @EqualsAndHashCode(callSuper=true)
    @ToString(callSuper = true)
    @SuperBuilder
    public static class SearchResult extends Base{
    }

    @Data
    @JsonNaming(PropertyNamingStrategies.LowerCamelCaseStrategy.class)
    @NoArgsConstructor(access = AccessLevel.PROTECTED)
    @EqualsAndHashCode(callSuper=true)
    @ToString(callSuper=true)
    @SuperBuilder
    public static class Detail extends Base{

    }

    @Data
    @JsonNaming(PropertyNamingStrategies.LowerCamelCaseStrategy.class)
    @NoArgsConstructor(access = AccessLevel.PROTECTED)
    @EqualsAndHashCode()
    @ToString(callSuper=true)
    @SuperBuilder
    public static class Types{
        private String name;
        private String val;
        private String mainResult;
    }
}
