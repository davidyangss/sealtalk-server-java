package com.rcloud.server.sealtalk.dao;

import com.rcloud.server.sealtalk.domain.GroupMembers;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface GroupMembersMapper extends Mapper<GroupMembers> {

    List<GroupMembers> queryGroupMembersWithGroupByMemberId(@Param("memberId") Long memberId);

    List<GroupMembers> queryGroupMembersWithUsersByGroupId(@Param("groupId") String groupId,@Param("isDeleted") Integer isDeleted);

    GroupMembers queryGroupMembersWithGroupByGroupIdAndMemberId(@Param("groupId") String groupId, @Param("memberId") Long memberId);

    List<GroupMembers> selectGroupMembersWithUsersByGroupIdsAndVersion(@Param("groupIdList") List<String> groupIdList, @Param("version") Long version);

    int insertBatch(@Param("groupMemberList") List<GroupMembers > groupMemberList);
}