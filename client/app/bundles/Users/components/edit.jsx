import PropTypes from 'prop-types';
import React from 'react';
import _ from 'lodash';
import EditAccount from './edit_account';
import EditProfile from './edit_profile';

// Constants
const TAB_ACCOUNT = 'TAB_ACCOUNT' // account settings like name, email, password
const TAB_PROFILE = 'TAB_PROFILE' // profile settings like interests, bio

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
      tab: TAB_PROFILE,
    };
  }

  updateTab = (tab) => {
    this.setState({ tab });
  };

  renderContent () {
    if (this.state.tab === TAB_ACCOUNT) {
      return <EditAccount currentUser={this.props.currentUser}/>
    } else {
      return <EditProfile currentUser={this.props.currentUser} allInterests={this.props.allInterests} userInterests={this.props.userInterests}/>
    }
  }

  render() {
    let tab1class = 'edit-tab profile-tab'
    let tab2class = 'edit-tab account-tab'
    if (this.state.tab === TAB_PROFILE) {
      tab1class += ' selected'
    } else {
      tab2class += ' selected'
    }

    return (
      <div className='edit-page'>
        <div className='edit-tabs'>
          {/* updates the tab using lodash partial function */}
          <div className={tab1class} onClick={_.partial(this.updateTab, TAB_PROFILE)}> Edit Profile </div>
          <div className={tab2class} onClick={_.partial(this.updateTab, TAB_ACCOUNT)}> Edit Account </div>
        </div>

        <div className='edit-tab-content'>
          { this.renderContent() }
        </div>
      </div>
    );
  }
}
