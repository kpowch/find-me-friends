import React from 'react';
import ReactDOM from 'react-dom';
import Notifications from './Notifications';

export default class Sidebar extends React.Component {

  // delete a notification when read and refresh list
  deleteNotification = (notification) => {
    return (ev) => {
      ev.preventDefault();
      // send ajax to delete a notification
      $.ajax({
        data: {
          id: notification.id,
        },
        url: '/notifications/' + notification.id,
        type: 'DELETE',
        dataType: 'json',
        success: () => window.location = window.location.origin + "/chatrooms/" + notification.chatroom_id
      });
    };
  }

  render() {
    // this makes the code more readable
    const { first_name, last_name, email, bio, profile_picture } = this.props.currentUser;
    const { current_interests, notifications } = this.props

    return (
      <div className='sidebar-wrapper'>
        <h1 className='profile-heading profile-heading-placeholder'>Settings</h1>
        <div className='sidebar-card'>
          <h1 className='sidebar-name'>
             {first_name} {last_name}
          </h1>
          <div className='sidebar-email'>
            <span>{email}</span>
          </div>
        </div>
        <div className='sidebar-card'>
          <h2 className='sidebar-title'>Your Bio</h2>
          <div className='sidebar-bio-content'>
            <span>'{bio}'</span>
          </div>
        </div>
        <div className='sidebar-card'>
          <h2 className='sidebar-title'>Your Interests</h2>
          <ul className='sidebar-interests-list'>
            {current_interests.map((interest, i) =>
              <li key={i}>{interest}</li>
            )}
          </ul>
        </div>
        <div className='sidebar-notifications'>
          <Notifications notifications={notifications} deleteNotification={this.deleteNotification} />
        </div>
      </div>
    );
  }
}
