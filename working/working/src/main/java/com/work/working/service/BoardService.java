package com.work.working.service;

import com.work.working.dto.BoardDto;
import com.work.working.entity.Board;
import com.work.working.exception.BoardException;
import com.work.working.repository.BoardRepository;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Slf4j
@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;
    public Page<BoardDto.SearchResult> list(BoardDto.Search search, Pageable pageable){
        Page<Board> result = null;

        if(search.getType() != null){
            result = boardRepository.findByType(search.getType(), pageable);
        } else {
            result = boardRepository.findAll(pageable);
        }

        return result.map(data -> data.toSearchResultDto());
    }

    public BoardDto.Detail findDetail(long id) throws BoardException.NotFound {
        Optional<Board> optional = boardRepository.findById(id);
        if(optional.isPresent()){
            return optional.get().toDetailDto();
        }
        throw BoardException.NotFound.of();
    }

    @Transactional
    public long save(BoardDto.Create create){
        return boardRepository.save(create.toEntity()).getId();
    }

    @Transactional
    public void update(BoardDto.Update update){
        Optional<Board> optional = boardRepository.findById(update.getId());
        if(optional.isPresent()){
            optional.get().update(update);
        }
    }

    @Transactional
    public void delete(long id)throws BoardException.NotFound{
        Optional<Board> optional = boardRepository.findById(id);
        if(optional.isPresent()){
            boardRepository.delete(optional.get());
        } else {
            throw BoardException.NotFound.of();
        }
    }
}
