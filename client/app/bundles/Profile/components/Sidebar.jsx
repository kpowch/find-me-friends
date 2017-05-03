import React from 'react';
import ReactDOM from 'react-dom';
import Notifications from './Notifications';

export default class Sidebar extends React.Component {

  render() {
    // this makes the code more readable
    const { first_name, last_name, email, bio, profile_picture } = this.props.currentUser;
    const { current_interests, notifications } = this.props

    return (
      <div className='sidebar-wrapper'>
        <h1 className='sidebar-name fa fa-user-o fa-2x'>
          {first_name} {last_name}
        </h1>
        <p className='sidebar-email'>
          {email}
        </p>
        <p className='sidebar-bio'>
          Bio: <span className='sidebar-bio-content'>'{bio}'</span>
        </p>
        <div className='sidebar-interests'>
          Interests:
          <ul className='sidebar-interests-list'>
            {current_interests.map((interest, i) =>
              <li key={i}>{interest}</li>
            )}
          </ul>
        </div>
        <div className='sidebar-notifications'>
          <Notifications notifications={notifications} />
        </div>
      </div>
    );
  }
}
