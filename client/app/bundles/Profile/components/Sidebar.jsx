import React from 'react';
import ReactDOM from 'react-dom';

export default class Sidebar extends React.Component {

  render() {
    // this makes the code more readable
    const { first_name, last_name, email, bio, profile_picture } = this.props.currentUser;

    return (
      <div className="sidebar">
        <div>
          Your Profile
        </div>
        <div className="sidebar-avatar">
          <img src={profile_picture}/>
        </div>
        <div className="sidebar-name">
          {first_name} {last_name}
        </div>
        <div className="sidebar-email">
          {email}
        </div>
        <div className="sidebar-bio">
          {bio}
        </div>
      </div>
    );
  }
}
