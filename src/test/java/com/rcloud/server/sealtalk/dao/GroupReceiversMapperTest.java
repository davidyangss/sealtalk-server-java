package com.rcloud.server.sealtalk.dao;

import com.google.common.collect.ImmutableList;
import com.rcloud.server.sealtalk.domain.GroupReceivers;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * @Author: Jianlu.Yu
 * @Date: 2020/8/20
 * @Description:
 * @Copyright (c) 2020, rongcloud.cn All Rights Reserved
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class GroupReceiversMapperTest {
    @Autowired
    private GroupReceiversMapper groupReceiversMapper;


    @Test
    public void name() {
        String groupId = "1";
        Long requesterId = null;
        Integer groupReceiveType=2;
        List<Long> operatorList = ImmutableList.of(100l,101l,102l);
        List<Long> receiverIdList = ImmutableList.of(200l,201l,202l);

        List<GroupReceivers> groupReceiversList = groupReceiversMapper.selectReceiversWithList(groupId,requesterId,receiverIdList,operatorList,groupReceiveType);

        System.out.println(groupReceiversList);
    }
}