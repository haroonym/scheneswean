const db = require('../db');

async function getSights() {
  const { rows } = await db.query(
    'select * from sights left join packages_sights using (id) left join packages p on p.bez = packages_sights.bez order by id;',
  );
  return rows;
}

async function getSight(id) {
  const { rows } = await db.query(
    'select * from sights left join packages_sights using (id) left join packages p on p.bez = packages_sights.bez where id = $1;',
    [id],
  );
  return rows;
}

async function deletePackage(id, bez) {
  db.query('delete from packages_sights where id = $1 and bez = $2;', [id, bez]);
}

async function patchSight(body, id) {
  await db.query('update sights set title = $1, admission = $2 where id = $3', [
    body.title,
    body.admission,
    id,
  ]);
}

module.exports = { getSights, deletePackage, patchSight, getSight };
