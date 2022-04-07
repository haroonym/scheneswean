/* eslint-disable max-len */
const asyncHandler = require('express-async-handler');
const model = require('../model/vienna');

const getSights = asyncHandler(async (req, res) => {
  res.status(200).json(await model.getSights());
});

const getSight = asyncHandler(async (req, res) => {
  res.status(200).json(await model.getSight(req.params.id));
});

const deletePackage = asyncHandler(async (req, res) => {
  res
    .status(200)
    .send(`Package mit der ID ${req.params.id} und BEZ ${req.params.bez} wurde erfolgreich gelöscht`)
    .json(await model.deletePackage(req.params.id, req.params.bez));
});

const patchSight = asyncHandler(async (req, res) => {
  res
    .status(200)
    .send(`Sight mit der ID ${req.params.id} wurde erfolgreich geupdated`)
    .json(await model.patchSight(req.body, req.params.id));
});

module.exports = { getSights, deletePackage, patchSight, getSight };
