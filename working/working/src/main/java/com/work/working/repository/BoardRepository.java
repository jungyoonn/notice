package com.work.working.repository;

import com.work.working.common.BoardType;
import com.work.working.entity.Board;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardRepository extends JpaRepository<Board, Long> {
    Page<Board> findByType(BoardType boardType, Pageable pageable);
}
