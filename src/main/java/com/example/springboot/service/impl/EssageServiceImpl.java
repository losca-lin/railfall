package com.example.springboot.service.impl;

import com.example.springboot.entity.Essage;
import com.example.springboot.mapper.EssageMapper;
import com.example.springboot.service.IEssageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统公告 服务实现类
 * </p>
 */
@Service
public class EssageServiceImpl extends ServiceImpl<EssageMapper, Essage> implements IEssageService {

}
