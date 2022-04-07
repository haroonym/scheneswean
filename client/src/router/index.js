import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from '../views/Home.vue';
import Events from '../views/Events.vue';
import Sightseeing from '../views/Sightseeing.vue';
import DataTable from '../views/DataTable.vue';
import Details from '../views/Details.vue';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/events',
    name: 'Evens',
    component: Events,
  },
  {
    path: '/sightseeing',
    name: 'Sightseeing',
    component: Sightseeing,
  },
  {
    path: '/datatable',
    name: 'DataTable',
    component: DataTable,
  },
  {
    path: '/details/:id',
    name: 'Details',
    component: Details,
    props: true,
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue'),
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
