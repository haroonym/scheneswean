const express = require('express');
const { getSights, getSight, deletePackage, patchSight } = require('../controllers/vienna');

const router = express.Router();

router.get('/sights', getSights);
router.get('/sight/:id', getSight);
router.delete('/packages/:id/:bez', deletePackage);
router.patch('/sight/:id', patchSight);
module.exports = router;
