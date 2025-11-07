package com.pager.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.pager.mapper.QnaMapper;
import com.pager.model.Qna;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class QnaService {

    private final QnaMapper qnaMapper;

    /** 1. 등록 */
    public void insertQna(Qna qna) {
        qnaMapper.insertQna(qna);
    }

    /** 2. 수정 */
    public boolean updateQna(Qna qna) {
        return qnaMapper.updateQna(qna) > 0;
    }

    /** 3. 삭제 */
    public boolean deleteQna(Long id) {
        return qnaMapper.deleteQna(id) > 0;
    }

    /** 4. 단건 조회 */
    @Transactional(readOnly = true)
    public Qna getQna(Long id) {
        return qnaMapper.getQna(id);
    }

    /** 5. 전체 목록 */
    @Transactional(readOnly = true)
    public List<Qna> getQnaList() {
        return qnaMapper.getQnaList();
    }
}
