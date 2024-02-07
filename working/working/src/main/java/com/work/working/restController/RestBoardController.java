package com.work.working.restController;

import com.work.working.common.SuccessCode;
import com.work.working.dto.BoardDto;
import com.work.working.exception.BoardException;
import com.work.working.service.BoardService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
public class RestBoardController {
    @Autowired
    BoardService boardService;

    @PostMapping("/update")
    @ResponseBody
    public SuccessCode update(@RequestBody @Valid BoardDto.Update update) throws Exception{
        boardService.update(update);
        return SuccessCode.UPDATE_SUCCESS;
    }

    @GetMapping("/delete")
    @ResponseBody
    public SuccessCode delete(long id) throws BoardException.NotFound {
        boardService.delete(id);

        return SuccessCode.DELETE_SUCCESS;
    }
}
