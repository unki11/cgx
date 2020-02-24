package com.kh.cgx.service.pay;

import java.net.URISyntaxException;

import com.kh.cgx.vo.kakao.KakaoPayRevokeReturnVO;
import com.kh.cgx.vo.kakao.KakaoPaySuccessReadyVO;
import com.kh.cgx.vo.kakao.KakaoPaySuccessReturnVO;
import com.kh.cgx.vo.kakao.PayReadyReturnVO;
import com.kh.cgx.vo.kakao.PayReadyVO;

public interface PayService {
	
	PayReadyReturnVO ready(PayReadyVO vo) throws URISyntaxException;
	KakaoPaySuccessReturnVO approve(KakaoPaySuccessReadyVO vo) throws URISyntaxException;
	KakaoPayRevokeReturnVO revoke(int no) throws URISyntaxException;
}
