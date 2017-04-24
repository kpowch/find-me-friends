import PropTypes from 'prop-types';
import React from 'react';
import _ from 'lodash';
import EditAccount from './edit_account';
import EditInterests from './edit_interests';

// Constants
const TAB_ACCOUNT = 'TAB_ACCOUNT'
const TAB_INTERESTS = 'TAB_INTERESTS'

// it doesn't matter what we call this since the entire file is being exported
// and given a new name in registration.jsx (called EditUser)
export default class EditUser extends React.Component {
  // validations for front-end code. prints errors if wrong but doesn't enforce anything
  static propTypes = {
    interests: PropTypes.array.isRequired
  };

  constructor(props, _railsContext) {
    super(props);
    this.state = {
      tab: TAB_ACCOUNT,
      interests: this.props.interests
    };
  }

  updateTab = (tab) => {
    this.setState({ tab });
  };

  renderContent () {
    if (this.state.tab === TAB_ACCOUNT) {
      return <EditAccount />
    } else {
      return <EditInterests />
    }
  }

  render() {

    let tab1class = 'edit-tab interest-tab'
    let tab2class = 'edit-tab account-tab'
    if (this.state.tab === TAB_INTERESTS) {
      tab1class += ' selected'
    } else {
      tab2class += ' selected'
    }

    return (
      <div className='edit-page'>
        <div className='edit-tabs'>
          {/* updates the tab using lodash partial function */}
          <div className={tab1class} onClick={_.partial(this.updateTab, TAB_INTERESTS)}> Edit Interests </div>
          <div className={tab2class} onClick={_.partial(this.updateTab, TAB_ACCOUNT)}> Edit Account </div>
        </div>

        <div className='edit-tab-content'>
          { this.renderContent() }
        </div>
      </div>
    );
  }
}
