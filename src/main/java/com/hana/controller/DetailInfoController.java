package com.hana.controller;

import com.hana.data.KeyStore;
import com.hana.data.dto.*;
import com.hana.service.*;
import com.hana.data.dto.InterestlistDto;
import com.hana.data.dto.ServiceDto;
import com.hana.data.dto.SvccntDto;
import com.hana.service.InterestlistService;
import com.hana.util.PublicServiceUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import java.util.List;

// 지역구별 컨텐츠 조회 컨트롤러
@Controller
@RequestMapping("/service")
@RequiredArgsConstructor
public class DetailInfoController {

    final ServiceService serviceService;
    final InterestlistService interestlistService;
    final SvccntService svccntService;
    final ReviewService reviewService;
    final QnaService qnaService;
    final KeyStore keyStore;

    // 지도로 찾아보기 -> 행사 상세정보
    @RequestMapping("")
    public String serviceDetailShow(@RequestParam("detail") String serviceId, Model model) {
        // DB에서 serviceId로 조회해서 dto 가져오기
        ServiceDto serviceDto = null;
        List<ReviewlistDto> reviewlistDto = null;

        try {
            serviceDto = serviceService.get(serviceId);
            reviewlistDto = reviewService.selrev(serviceId);

            Object serviceDetailData = PublicServiceUtil.getServiceDetailData(keyStore.publicServiceKey, "1", "1", serviceId);

            model.addAttribute("service", serviceDto);
            model.addAttribute("review", reviewlistDto);

            // 서비스 상세정보
            model.addAttribute("detail", serviceDetailData);
            model.addAttribute("prevMenu", "지도로 찾아보기");
            model.addAttribute("center", "temp");
            model.addAttribute("lat", serviceDto.getLat());
            model.addAttribute("lng", serviceDto.getLng());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }

    // 해당 행사에 대한 사용자의 좋아요 여부
    @ResponseBody
    @RequestMapping("/getLikeData")
    public Object getLikeData(@RequestParam("serviceId") String serviceId,
                              @RequestParam("memberId") String memberId) {
        InterestlistDto interestlistDto = null;

        try {
            interestlistDto = interestlistService.getByServiceMemberId(serviceId, memberId);
            if (interestlistDto != null) return true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // 해당 행사에 대한 좋아요 개수
    @ResponseBody
    @RequestMapping("/getLikeCntData")
    public Object getLikeCntData(@RequestParam("serviceId") String serviceId) {
        List<InterestlistDto> interestlistDtoList = null;

        try {
            interestlistDtoList = interestlistService.getOther(serviceId);
            if (interestlistDtoList != null && interestlistDtoList.size() > 0) {
                return interestlistDtoList.size();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    // 해당 행사에 유저가 좋아요 버튼을 클릭했을 때 업데이트
    @ResponseBody
    @RequestMapping("/dolike")
    public Object doLike(@RequestParam("serviceId") String serviceId,
                         @RequestParam("memberId") String memberId) {

        try {
            interestlistService.add(InterestlistDto.builder().memberid(memberId)
                            .svcid(serviceId).build());
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // 해당 행사에 유저가 좋아요 버튼을 다시 클릭했을 떄 업데이트
    @ResponseBody
    @RequestMapping("/dodislike")
    public Object doDisLike(@RequestParam("serviceId") String serviceId,
                            @RequestParam("memberId") String memberId) {

        try {
            interestlistService.deleteByServiceMemberId(memberId, serviceId);
            return true;
        } catch (Exception e){
            e.printStackTrace();
        }

        return false;
    }

    // 행사 상세정보 클릭했을 때 조회수 증가 -> 메인화면 인기 행사 띄어주기 위해서
    @RequestMapping("/increaseCnt")
    public void increaseServiceCnt(@RequestParam("serviceId") String serviceId) {
        SvccntDto svccntDto = null;

        try {
            svccntDto = svccntService.get(serviceId);
            if (svccntDto == null) {
                svccntDto = new SvccntDto(serviceId, 1);
                svccntService.add(svccntDto);
            } else {
                svccntDto.setCnt(svccntDto.getCnt() + 1);
                svccntService.modify(svccntDto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
