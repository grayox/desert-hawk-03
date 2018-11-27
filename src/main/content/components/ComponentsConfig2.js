import { MaterialUIRoutes } from 'main/content/components/material-ui/MaterialUIRoutes';
import { FuseLoadable } from '@fuse';

export const ComponentsConfig = {
  routes: [
    ...MaterialUIRoutes,
    {
      path: '/dashboard',
      component: FuseLoadable({
        loader: () => import('my-app/layouts/dashboard/Dashboard')
      })
    },
    {
      path: '/inbox',
      component: FuseLoadable({
        loader: () => import('my-app/containers/inbox/InboxContainer')
      })
    },
    {
      path: '/archive',
      component: FuseLoadable({
        loader: () => import('my-app/layouts/archive/Archive')
      })
    },
    {
      path: '/outbox',
      component: FuseLoadable({
        loader: () => import('my-app/layouts/outbox/Outbox')
      })
    },
    {
      path: '/contacts',
      component: FuseLoadable({
        loader: () => import('my-app/layouts/contacts/Contacts')
      })
    },
    {
      path: '/feedback',
      component: FuseLoadable({
        loader: () => import('my-app/layouts/feedback/Feedback')
      })
    },
    {
      path: '/settings',
      component: FuseLoadable({
        loader: () => import('my-app/layouts/settings/Settings')
      })
    },
  ]
};

