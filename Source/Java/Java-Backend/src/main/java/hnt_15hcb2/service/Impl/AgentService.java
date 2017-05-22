package hnt_15hcb2.service.Impl;

import hnt_15hcb2.dao.Impl.AgentDAOImpl;
import hnt_15hcb2.entity.AgentEntity;
import hnt_15hcb2.service.IAgentService;

import java.util.List;

public class AgentService implements IAgentService<AgentEntity> {
    private AgentDAOImpl agentDAO;

    public void setAgentDAO(AgentDAOImpl agentDAO) {
        this.agentDAO = agentDAO;
    }

    @Override
    public void create(AgentEntity agentEntity) throws Exception {

    }

    @Override
    public boolean update(AgentEntity agentEntity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String id) throws Exception {
        return false;
    }

    @Override
    public AgentEntity get(String id) throws Exception {
        return null;
    }

    @Override
    public List<AgentEntity> getall() throws Exception {
        return agentDAO.getall(AgentEntity.class);
    }
}
