'use strict';

const childProcess= require("child_process");
const path= require("path");
var Promise = require('promise');

const backupDatabase = () => {
  const scriptFilePath =path.resolve(__dirname, "./backup.sh");

  return new Promise((resolve, reject) => {

    childProcess.execFile(scriptFilePath, {maxBuffer: 1024 * 102400}, (error) => {
  
    if (error) {
        console.error(error);
        resolve(false);
    }

      resolve(true);
    });
  });
};

module.exports.handler = async (event) => {
  const isBackupSuccessful = await backupDatabase();

  if (isBackupSuccessful) {
    return {
      status: "success",
      message: "Database backup completed successfully!"
    };
  }

  return  {
    statusCode: 500,
    message: "Failed to backup the database! Check the logs for more details"
  };
};
