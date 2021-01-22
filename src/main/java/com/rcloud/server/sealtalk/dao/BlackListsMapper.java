package com.rcloud.server.sealtalk.dao;

import com.rcloud.server.sealtalk.domain.BlackLists;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface BlackListsMapper extends Mapper<BlackLists> {
    List<BlackLists> selectBlackListsWithFriendUsers(@Param("userId") Integer userId);

    List<BlackLists> selectBlackListsWithUsersAndVersion(@Param("userId") Integer currentUserId, @Param("version") Long timestamp);
}