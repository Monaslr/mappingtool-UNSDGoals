const express = require('express');
const router = express();
const projectController = require('../controllers/controllers');

router.use(express.json());
// GET Goals
router.get('/goals', projectController.getAllGoals); //, authenticateToken

// GET Targets by Goal
router.get('/goals/:goalId/targets', projectController.getTargetsByGoal); // , authenticateToken

// GET Indicators by Target
router.get('/targets/:targetId/indicators', projectController.getIndicatorsByTarget); // , authenticateToken

// CREATE Project
router.post('/project', projectController.createProject);

// GET ALL PROJECTS
router.get('/projects', projectController.getAllProjects);

// GET PROJECT BY ID  
router.get('/projects/:projectId', projectController.getProjectById);

// GET PROJECT BY USER
router.get('/projects/users/:userId', projectController.getProjectByUser);

// GET PROJECTS TARGETS 
router.get('/projects_targets/:projectId', projectController.getProjectTargetsByProjectId);

// UPDATE PROJECTS
router.put('/projects/:projectId',projectController.updateProjectById);

//DELETE PROJECTS
router.delete('/projects/:projectId',projectController.deleteProjectById)

// GET User by Id
router.get('/users/:userId', projectController.getUserById);

//GET username


module.exports = router;
