package com.work.working.entity;

import com.work.working.common.BoardType;
import com.work.working.dto.BoardDto;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Comment;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.lang.reflect.Member;
import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Comment("공지사항")
public class Board {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Comment("id")
    private long id;

    @Comment("제목")
    private String title;

    @Column(columnDefinition = "TEXT")
    @Comment("내용")
    private String contents;

    @Comment("타입")
    private BoardType type;

    @Comment("작성자")
    private String name;

    @Comment("비밀번호")
    private String password;

    @Comment("생성날짜")
    private LocalDateTime createdDate;

    @Comment("생성자")
    private String createdBy;

    @Comment("수정날짜")
    private LocalDateTime modifiedDate;

    @Comment("수정자")
    private String modifiedBy;

    @PrePersist
    public void onPrePersist(){
        this.createdDate = LocalDateTime.now();
        this.modifiedDate = this.createdDate;

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        try{
            Member member = (Member)auth.getPrincipal();
            this.createdBy = member.getName();
            this.modifiedBy = member.getName();
        }catch(Exception e){
        }

    }

    @PreUpdate
    public void onPreUpdate(){
        this.modifiedDate = LocalDateTime.now();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        try{
            Member member = (Member)auth.getPrincipal();
            this.modifiedBy = member.getName();
        }catch(Exception e){
        }

    }

    public void update(BoardDto.Update dto){
        this.title = dto.getTitle();
        this.contents = dto.getContents();
        this.type = dto.getType();
    }

    public BoardDto.SearchResult toSearchResultDto(){
        return BoardDto.SearchResult.builder()
                .id(this.id)
                .title(this.title)
                .contents(this.contents)
                .type(this.type)
                .name(this.name)
                .password(this.password)
                .createdBy(this.getCreatedBy())
                .modifiedBy(this.getModifiedBy())
                .createdDate(this.getCreatedDate())
                .modifiedDate(this.getModifiedDate())
                .build();
    }

    public BoardDto.Detail toDetailDto(){
        return BoardDto.Detail.builder()
                .id(this.id)
                .title(this.title)
                .contents(this.contents)
                .type(this.type)
                .name(this.name)
                .password(this.password)
                .createdBy(this.getCreatedBy())
                .modifiedBy(this.getModifiedBy())
                .createdDate(this.getCreatedDate())
                .modifiedDate(this.getModifiedDate())
                .build();
    }
}
