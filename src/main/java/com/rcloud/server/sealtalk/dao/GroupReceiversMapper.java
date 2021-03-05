package com.rcloud.server.sealtalk.dao;

import com.rcloud.server.sealtalk.domain.GroupReceivers;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface GroupReceiversMapper extends Mapper<GroupReceivers> {


    List<GroupReceivers> selectReceiversWithList(@Param("groupId") String groupId,@Param("requesterId") Long requesterId,@Param("receiverIdList") List<Long> receiverIdList,@Param("operatorList") List<Long> operatorList,@Param("groupReceiveType") int groupReceiveType);

    int updateReceiversWithList(@Param("requesterIdForUpdate") Long requesterIdForUpdate,@Param("timestamp") Long timestamp,@Param("status") Integer status,@Param("groupId") String groupId,@Param("requesterId") Long requesterId,@Param("receiverIdList") List<Long> receiverIdList,@Param("operatorList") List<Long> operatorList,@Param("groupReceiveType") int groupReceiveType);

    int insertBatch(@Param("groupReceiverList") List<GroupReceivers> groupReceiverList);

    List<GroupReceivers> selectGroupReceiversWithIncludes(@Param("userId") Long userId);
}