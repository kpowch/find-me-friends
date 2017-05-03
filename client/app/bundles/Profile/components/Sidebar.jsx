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
        <div className='sidebar-card'>
          <h1 className='sidebar-name'>
             {first_name} {last_name}
          </h1>
          <p className='sidebar-email'>
            {email}
          </p>
        </div>
        <div className='sidebar-card'>
          <h2 className='sidebar-title'>About Me</h2>
          <div className='sidebar-bio-content'>
            <span>'{bio}'</span>
          </div>
        </div>
        <div className='sidebar-card'>
          <h2 className='sidebar-title'>Interests</h2>
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
