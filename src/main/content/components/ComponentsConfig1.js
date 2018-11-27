import {MaterialUIRoutes} from 'main/content/components/material-ui/MaterialUIRoutes';
// import Dashboard from './Dashboard';
import Dashboard from 'my-app/layouts/dashboard/Dashboard';
import InboxContainer from 'my-app/containers/inbox/InboxContainer';
import Archive from 'my-app/layouts/archive/Archive';
import Outbox from 'my-app/layouts/outbox/Outbox';
import Contacts from 'my-app/layouts/contacts/Contacts';
import Feedback from 'my-app/layouts/feedback/Feedback';
import Settings from 'my-app/layouts/settings/Settings';

export const ComponentsConfig = {
    routes: [
        ...MaterialUIRoutes,
        {
            path     : '/dashboard',
            component: Dashboard,
        },
        {
            path     : '/inbox',
            component: InboxContainer,
        },
        {
            path     : '/archive',
            component: Archive,
        },
        {
            path     : '/outbox',
            component: Outbox,
        },
        {
            path     : '/contacts',
            component: Contacts,
        },
        {
            path     : '/feedback',
            component: Feedback,
        },
        {
            path     : '/settings',
            component: Settings,
        },
    ]
};