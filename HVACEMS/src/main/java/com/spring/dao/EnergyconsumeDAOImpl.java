package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchListCommand;
import com.spring.dto.EnergyconsumeVO;

public class EnergyconsumeDAOImpl implements EnergyconsumeDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<EnergyconsumeVO> selectEnergyconsume(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<EnergyconsumeVO> energyconsumeList = session.selectList("Energyconsume-Mapper.selectEnergyconsume",
				command, rowBounds);

		return energyconsumeList;
	}

	@Override
	public int selectSearchEnergyconsumeListCount(SearchListCommand command) throws SQLException {
		int count = session.selectOne("Energyconsume-Mapper.selectSearchEnergyconsumeListCount", command);

		return count;
	}

	@Override
	public List<SearchListCommand> getMonthlyConsumption(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<SearchListCommand> energyconsumeMonth = session.selectList("Energyconsume-Mapper.getMonthlyConsumption",
				command, rowBounds);

		return energyconsumeMonth;
		
		
	}

	@Override
	public List<Integer> getMonthlyConsumptionCount(SearchListCommand command) throws SQLException {
		List<Integer> count = session.selectList("Energyconsume-Mapper.getMonthlyConsumptionCount",command);
		
		return count;
	}
	
	@Override
	public List<SearchListCommand> getYearConsumption(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<SearchListCommand> energyconsumeYear = session.selectList("Energyconsume-Mapper.getYearConsumption", command, rowBounds);
		
		return energyconsumeYear;
		
	}

	@Override
	public void insertConsumeEnergy(EnergyconsumeVO energyconsume) throws SQLException {
		session.update("Energyconsume-Mapper.insertConsumeEnergy", energyconsume);
	}

	@Override
	public int selectEnergyConsumeSeqNext() throws SQLException {
		int seqEnergyconsume = session.selectOne("Energyconsume-Mapper.selectEnergyConsumeSeqNext");
				
		return seqEnergyconsume;
	}
	
	@Override
	public int selectTodayEnergyconsume() throws SQLException {
		int sum = session.selectOne("Energyconsume-Mapper.selectTodayEnergyconsume");

		return sum;
	}

	@Override
	public int selectThisMonthEnergy() throws SQLException {
		int sum = session.selectOne("Energyconsume-Mapper.selectThisMonthEnergy") == null ? 0 : session.selectOne("Energyconsume-Mapper.selectThisMonthEnergy");
		return sum;
	}
}
