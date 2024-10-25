import axios from "axios";

const api = axios.create({
    baseURL: 'http://localhost:3001/api/'
});

const getGoals = async () =>{
    return api.get('/goals');
}

const getTargetsByGoal = async (goalId) =>{
    return api.get(`/goals/${goalId}/targets`);
};

const getIndicatorsByTarget = async (targetId) =>{
    return api.get(`/targets/${targetId}/indicators`);
};

const updateProject = async function (projectId, body){
    return api.put(`/projects/${projectId}`, body);
};

const deleteProject = async (projectId)=>{
    return api.delete(`/projects/${projectId}`)
};

// Get User by Id
const getUserById = async function (userId){
    return api.get(`/users/${userId}`)
}

//Get project by Id
const getProjectById = async function (projectId){
    return api.get(`/projects/${projectId}`)
}

//Get project by Id
const getProjectByUser = async function (userId){
    return api.get(`/projects/users/${userId}`)
}

const getProjects = async () =>{
    return api.get('/projects');
}

const insertProject = async function (body){
    return api.post('/project', body);
};

const getProjectsTargetsByProjectId = async (projectId) => {
    return api.get(`/projects_targets/${projectId}`);
}

const apiCalls = {
    getGoals,
    getTargetsByGoal,
    getIndicatorsByTarget,
    insertProject,
    updateProject,
    getUserById,
    getProjects,
    getProjectByUser,
    getProjectById,
    deleteProject,
    getProjectsTargetsByProjectId
};

export default apiCalls;
