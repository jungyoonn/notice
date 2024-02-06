package com.work.working.controller;


import com.work.working.common.BoardType;
import com.work.working.common.Const;
import com.work.working.dto.BoardDto;
import com.work.working.exception.BoardException;
import com.work.working.service.BoardService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Slf4j
@Controller
public class BoardController {
    @Autowired
    BoardService boardService;

    @RequestMapping(value = "main")
    public String mainIndex(BoardDto.Search search,
                            @PageableDefault(size = Const.DEFAULT_PAGE_SIZE)
                            @SortDefault.SortDefaults({@SortDefault(sort = "createdDate", direction = Sort.Direction.DESC)}) Pageable pageable,
                            Model model){
        List<BoardDto.Types> boardTypeList = Stream.of(BoardType.values()).map(d -> BoardDto.Types.builder()
                .name(d.getName())
                .val(d.toString())
                .build()).collect(Collectors.toList());
        model.addAttribute("boardTypeList", boardTypeList);

        Page<BoardDto.SearchResult> page = boardService.list(search, pageable);
        model.addAttribute("page", page);
        model.addAttribute("search", search);

        return "board/main";
    }

    @RequestMapping(value = "new")
    public String newIndex(Model model){
        List<BoardDto.Types> boardTypeList = Stream.of(BoardType.values()).map(d -> BoardDto.Types.builder()
                .name(d.getName())
                .val(d.toString())
                .build()).collect(Collectors.toList());
        model.addAttribute("boardTypeList", boardTypeList);

        return "board/new";
    }

    @RequestMapping(value = "detail")
    public String detailIndex(long id, Model model) throws BoardException.NotFound {
        List<BoardDto.Types> boardTypeList = Stream.of(BoardType.values()).map(d -> BoardDto.Types.builder()
                .name(d.getName())
                .val(d.toString())
                .build()).collect(Collectors.toList());
        model.addAttribute("boardTypeList", boardTypeList);

        BoardDto.Detail detail = boardService.findDetail(id);
        model.addAttribute("detailDto", detail);

        return "board/edit";
    }

    @RequestMapping(value = "save")
    public String saveIndex(@Valid BoardDto.Create create, Model model){
        boardService.save(create);
        model.addAttribute("saveOk", true);
        return "board/main";
    }

    @RequestMapping(value = "update")
    public String updateIndex(@Valid BoardDto.Update update, Model model){
        boardService.update(update);
        model.addAttribute("updateOk", true);
        return "board/main";
    }

    @RequestMapping(value = "delete")
    public String deleteIndex( long id, Model model) throws BoardException.NotFound {
        boardService.delete(id);
        model.addAttribute("deleteOk", true);
        return "Board/main";
    }
}
