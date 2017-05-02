import React from 'react';
import ReactDOM from 'react-dom';

export default class Sidebar extends React.Component {

  render() {
    // this makes the code more readable
    const { first_name, last_name, email, bio, profile_picture } = this.props.currentUser;

    return (
      <div className="sidebar">
        <div className="sidebar-name">
          <i className="fa fa-user-o fa-2x" aria-hidden="true"></i>
          {first_name} {last_name}
        </div>
        <div className="sidebar-bio">
          Bio: "{bio}"
        </div>
        <div className="sidebar-email">
          {email}
        </div>
        <div className="sidebar-interests">
          Interests:
          <ul className="sidebar-interests-list">
            {this.props.current_interests.map((interest, i) =>
              <li key={i}>
                {interest}
              </li>
              )}
          </ul>
        </div>
      </div>
    );
  }
}