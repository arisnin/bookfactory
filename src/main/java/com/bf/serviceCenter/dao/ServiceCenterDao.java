package com.bf.serviceCenter.dao;

import java.util.List;

import com.bf.serviceCenter.dto.ServiceCenterDtoFre;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 고객센터 DAO 인터페이스
 */
public interface ServiceCenterDao {

	int infoCount();

	List<ServiceCenterDtoFre> infoMain();

	ServiceCenterDtoFre infoRead(int num);

	ServiceCenterDtoFre infoFile(int num);


}
