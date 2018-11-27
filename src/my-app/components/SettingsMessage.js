import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles/index';
import { Typography } from '@material-ui/core';
import classNames from 'classnames';
// import { Link } from 'react-router-dom';
import { FuseAnimate } from '@fuse';

import Button from '@material-ui/core/Button';

const styles = theme => ({
  button: {
    margin: theme.spacing.unit,
  },
  // searchWrapper: {
  //   width: '100%',
  //   height: 56,
  //   padding: 18,
  //   display: 'flex',
  //   alignItems: 'center'
  // },
  // search: {
  //   paddingLeft: 16
  // }
});

function SettingsMessage(props) {
  const { classes, onClick } = props;
  return (
    <div className={classNames(classes.root, "flex flex-col flex-1 items-center justify-center p-16")}>
      <div className="max-w-512 text-center">
        <FuseAnimate delay={100} animation="transition.slideDownIn">
          <Typography variant="display2" color="inherit" className="font-medium mb-16">
            Howdy, pardner!
          </Typography>
        </FuseAnimate>
        {/* <Typography variant="caption" color="inherit" className="font-medium mb-16 italic">
            Make referrals. Get leads.
          </Typography> */}
        <FuseAnimate delay={200} animation="transition.fadeIn">
          <Typography variant="h5" color="textSecondary" className="mb-16">
            Welcome to Swap! Lets get started!
          </Typography>
        </FuseAnimate>
        <FuseAnimate delay={300} animation="transition.expandIn">
          <Typography variant="display4" color="inherit" className="font-medium mb-16">
            <span role="img" aria-label="smiling cowboy emoji">🤠</span>
          </Typography>
        </FuseAnimate>
        <FuseAnimate delay={400} animation="transition.fadeIn">
          <Typography variant="body1" color="textSecondary" className="mb-16">
            We need to know your location and business category
            so we can send you the right kind of local leads
          </Typography>
        </FuseAnimate>
        <FuseAnimate delay={600} animation="transition.slideUpIn">
          <Typography variant="button">
            <Button
              className={classes.button}
              color="secondary"
              variant="contained"
              onClick={onClick}
              >
                Choose your settings
            </Button>
          </Typography>
        </FuseAnimate>
      </div>
    </div>
  );
}

SettingsMessage.propTypes = {
  classes: PropTypes.object.isRequired,
  onClick: PropTypes.func.isRequired,
};

export default withStyles(styles, { withTheme: true })(SettingsMessage);
// export default withStyles(styles, { withTheme: true })(Dashboard);