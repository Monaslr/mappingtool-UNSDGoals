const connection = require("../db/connect");

// Get all goals
async function queryDatabase(req, res) {
  const query = "SELECT * FROM Goals";
  const preparedStatement = connection.format(query);
  connection.query(preparedStatement, function (error, results) {
    if (error) {
      return res.status(400).json({ success: false, error: error });
    } else {
      return res.status(200).json({ success: true, data: results });
    }
  });
}
const getAllGoals = async (req, res) => {
  queryDatabase(req, res);
};

// Get Targets by goal
const getTargetsByGoal = async (req, res) => {
  const { goalId } = req.params;
  const id = parseInt(goalId, 10);
  const query = "SELECT * FROM Targets WHERE goal_id = ?";
  const preparedStatement = connection.format(query, id);
  connection.query(preparedStatement, function (error, results) {
    if (error) {
      return res.status(400).json({ success: false, error: error });
    } else {
      return res.status(200).json({ success: true, data: results });
    }
  });
};

// Get all indicators by Target
const getIndicatorsByTarget = async (req, res) => {
  const { targetId } = req.params;
  const id = parseInt(targetId, 10);
  const query = "SELECT * FROM Indicators WHERE target_id = ?";
  const preparedStatement = connection.format(query, id);
  connection.query(preparedStatement, function (error, results) {
    if (error) {
      return res.status(400).json({ success: false, error: error });
    } else {
      return res.status(200).json({ success: true, data: results });
    }
  });
};


//Get all projects
const getAllProjects = async (req, res) => {
  const query = "SELECT * FROM projects";
  const preparedStatement = connection.format(query);
  connection.query(preparedStatement, function (error, results) {
    if (error) {
      return res.status(400).json({ success: false, error: error });
    } else {
      return res.status(200).json({ success: true, data: results });
    }
  });
};


// Get projects by ID
const getProjectById = async (req, res) => {
  const { projectId } = req.params;
  const id = parseInt(projectId, 10);
  const query = "SELECT * FROM projects WHERE project_id = ?";
  const preparedStatement = connection.format(query, id);
  connection.query(preparedStatement, function (error, results) {
    if (error) {
      return res.status(400).json({ success: false, error: error });
    } else {
      return res.status(200).json({ success: true, data: results });
    }
  });
};


// Get projects by user
const getProjectByUser = async (req, res) => {
  const { userId } = req.params;
  const id = parseInt(userId, 10);
  const query = "SELECT * FROM projects WHERE user_id = ?";
  const preparedStatement = connection.format(query, id);
  connection.query(preparedStatement, function (error, results) {
    if (error) {
      return res.status(400).json({ success: false, error: error });
    } else {
      return res.status(200).json({ success: true, data: results });
    }
  });
};

// Get users from projects
const getUsersFromProjects = async (req, res) => {
  const query = "SELECT user_id FROM projects";
  const preparedStatement = connection.format(query, id);
  connection.query(preparedStatement, function (error, results) {
    if (error) {
      return res.status(400).json({ success: false, error: error });
    } else {
      return res.status(200).json({ success: true, data: results });
    }
  });
};

// Create a Project
const createProject = async (req, res)=>{
  const {projectName, projectDesc, userId, projectTag, selectedTargets} = req.body;
  const projectQuery = "INSERT INTO projects (project_name, project_desc, user_id, tag) VALUES (?, ?, ?, ?)";
  const values = [projectName,  projectDesc, userId, projectTag];

  const preparedStatement = connection.format(projectQuery);
  connection.query(preparedStatement, values, function(error, results) {
      if (error) {
          return res.status(400).json({ success: false, error: error });
      } 
      const projectId = results.insertId;
      // // Insert Into project_indicators
      const targetQuery = "INSERT INTO projects_targets (project_id, target_id) VALUES (?, ?)";
      const selectedTargetQueries = selectedTargets.map(target => {
          return new Promise((resolve, reject) => {
              connection.query(targetQuery, [projectId, target.targetId], function(error, results) {
                  if (error) {
                      return reject(err);
                      
                  } else {
                      return resolve(results);
                      
                  }
              });
          });
          
      });

      Promise.all(selectedTargetQueries)
          .then(results => {
              res.status(200).json({ success: true, message: "Project created successfully", data: results})
          })
          .catch(error =>{
              res.status(400).json({ success: false, error: error })
          })

  });


};  

// Get a Projects Targets
const getProjectsTargets = async (req, res) => {
  const { projectId } = req.params;
  const id = parseInt(projectId, 10);
  const query = "SELECT * FROM projects_targets WHERE project_id = ?";
  const preparedStatement = connection.format(query, id);
  connection.query(preparedStatement, function (error, results) {
    if (error) {
      return res.status(400).json({ success: false, error: error });
    } else {
      return res.status(200).json({ success: true, data: results });
    }
  });
};


// Get User by ID
const getUserById = async (req, res) => {
  const { userId } = req.params;
  const id = parseInt(userId, 10);
  const query = "SELECT * FROM users WHERE user_id = ?";
  const preparedStatement = connection.format(query, id);
  connection.query(preparedStatement, function (error, results) {
    if (error) {
      return res.status(400).json({ success: false, error: error });
    } else {
      return res.status(200).json({ success: true, data: results });
    }
  });
};


// Delete project
const deleteProjectById = async (req, res) => {
  const { projectId } = req.params;
  const id = parseInt(projectId, 10);
  const deletedTargetsQuery =
    "DELETE FROM projects_targets WHERE project_id = ?";
  connection.query(deletedTargetsQuery, [id], (error, results) => {
    if (error) {
      return res.status(400).json({ success: false, error: error });
    } 
    const deletedProjectQuery =
    "DELETE FROM projects WHERE project_id = ?";
    connection.query(deletedProjectQuery, [id], (error, results) => {
      if (error) {
        return res.status(400).json({ success: false, error: error });
      }     else {
        return res.status(200).json({ success: true, data: results });
      }
    });
  });
};

// Update a Project
const updateProjectById = async (req, res) => {
  const { projectId } = req.params;
  const id = parseInt(projectId, 10);
  const { projectName, projectDesc, userId, projectTag, selectedTargets } =
    req.body;
  const projectQuery =
    "UPDATE projects SET project_name = ?, project_desc = ?, user_id = ?, tag = ? WHERE project_id = ?";
  const values = [projectName, projectDesc, userId, projectTag, id];

  const preparedStatement = connection.format(projectQuery);
  connection.query(preparedStatement, values, function (error, results) {
    if (error) {
      return res.status(400).json({ success: false, error: error });
    }
    // Delete old selected targets in the projects_targets
    const deletedTargetsQuery =
      "DELETE FROM projects_targets WHERE project_id = ?";
    connection.query(deletedTargetsQuery, [id], (error, results) => {
      if (error) {
        return res.status(400).json({ success: false, error: error });
      }
      // Insert Into project_targets
      const targetQuery =
        "INSERT INTO projects_targets (project_id, target_id) VALUES (?, ?)";
      const selectedTargetQueries = selectedTargets.map((target) => {
        return new Promise((resolve, reject) => {
          connection.query(
            targetQuery,
            [id, target.targetId],
            (error, results) => {
              if (error) {
                return reject(err);
              } else {
                return resolve(results);
              }
            }
          );
        });
      });

      Promise.all(selectedTargetQueries)
        .then((results) => {
          res.status(200).json({
            success: true,
            message: "Project updated successfully",
            data: results,
          });
        })
        .catch((error) => {
          res.status(400).json({ success: false, error: error });
        });
    });
  });
};

// Get selected targets by project Id from projects_targets
const getProjectTargetsByProjectId = async (req, res) => {
  const { projectId } = req.params;
  const id = parseInt(projectId, 10);
  const projectTargetsQuery = `
    SELECT 
      p.project_id AS projectId, p.project_name, p.project_desc, p.tag,
      t.target_id AS targetId, t.target_name AS targetName, 
      g.goal_id AS goalId, g.goal_name AS goalName 
    FROM projects p
    LEFT JOIN projects_targets pt ON p.project_id = pt.project_id
    LEFT JOIN targets t ON pt.target_id = t.target_id
    LEFT JOIN goals g ON t.goal_id = g.goal_id
    WHERE p.project_id = ?;
  `;

  const preparedStatement = connection.format(projectTargetsQuery, id);
  connection.query(preparedStatement, function (error, results) {
    if (error) {
      return res.status(400).json({ success: false, error: error });
    } else {
      return res.status(200).json({ success: true, data: results });
    }
  });
};

module.exports = {
  getAllGoals,
  getTargetsByGoal,
  getIndicatorsByTarget,
  getUserById,
  getAllProjects,
  createProject,
  getProjectsTargets,
  getProjectByUser,
  getUsersFromProjects,
  getProjectTargetsByProjectId,
  getProjectById,
  deleteProjectById,
  updateProjectById
};
