package com.rcloud.server.sealtalk.service;

import com.rcloud.server.sealtalk.dao.GroupReceiversMapper;
import com.rcloud.server.sealtalk.domain.GroupReceivers;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: xiuwei.nie
 * @Date: 2020/7/6
 * @Description:
 * @Copyright (c) 2020, rongcloud.cn All Rights Reserved
 */
@Service
public class GroupReceiversService extends AbstractBaseService<GroupReceivers, Long> {

    @Resource
    private GroupReceiversMapper mapper;

    @Override
    protected Mapper<GroupReceivers> getMapper() {
        return mapper;
    }

    /**
     * 批量删除GroupReceivers
     *
     * @param groupId
     * @param memberIds
     */
    public void deleteByMemberIds(String groupId, Long[] memberIds) {
        Assert.notNull(groupId,"groupId is null");
        Assert.notEmpty(memberIds,"memberIds is empty");

        Example example = new Example(GroupReceivers.class);
        example.createCriteria().andEqualTo("groupId", groupId);

        Example.Criteria criteria2 = example.createCriteria();
        for (Long memberId : memberIds) {
            criteria2.orEqualTo("userId", memberId);
        }
        example.and(criteria2);
        this.deleteByExample(example);


    }

    /**
     * 根据groupId、userId删除GroupReverive
     *
     * @param groupId
     * @param userId
     */
    public void deleteGroupReverive(String groupId, Long userId) {
        Assert.notNull(groupId,"groupId is null");
        Assert.notNull(userId,"userId is null");

        Example example = new Example(GroupReceivers.class);
        example.createCriteria().andEqualTo("groupId", groupId)
                .andEqualTo("userId", userId);
        this.deleteByExample(example);

    }

    public List<GroupReceivers> getReceiversWithList(String groupId,Long requesterId,List<Long> receiverIdList, List<Long> operatorList, Integer groupReceiveType){

        return mapper.selectReceiversWithList(groupId,requesterId,receiverIdList,operatorList,groupReceiveType);
    }


    public int updateReceiversWithList(Long requesterIdForUpdate,Long timestamp,Integer status, String groupId,Long requesterId,List<Long> receiverIdList, List<Long> operatorList, Integer groupReceiveType){

        Assert.notEmpty(receiverIdList,"receiverIdList is empty");
        Assert.notEmpty(operatorList,"operatorList is empty");
        return mapper.updateReceiversWithList(requesterIdForUpdate,timestamp,status,groupId,requesterId,receiverIdList,operatorList,groupReceiveType);
    }


    public void batchSave(List<GroupReceivers> groupReceiverList) {
        Assert.notEmpty(groupReceiverList,"groupReceiverList is empty");
        List<GroupReceivers> grListForInsert = new ArrayList<>();

        Integer index = 0;
        for(int i=0;i<groupReceiverList.size();i++){

            grListForInsert.add(groupReceiverList.get(i));
            //批量插入groupReceiver，每1000条执行一次insert sql
            index++;
            if( index % 1000 == 0 || index.equals(groupReceiverList.size())){
                mapper.insertBatch(grListForInsert);
                grListForInsert.clear();
            }
        }
    }

    public List<GroupReceivers> getGroupReceiversWithIncludes(Long currentUserId) {
        return mapper.selectGroupReceiversWithIncludes(currentUserId);
    }
}
